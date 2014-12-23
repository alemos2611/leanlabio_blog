class Analytics
  class_attribute :backend
  self.backend = AnalyticsRuby

  def initialize(guest_id, client_id = nil)
    @client_id = client_id
  end

  def track(options)
    if client_id.present?
      options.merge!(context: { 'Google Analytics' => { clientId: @client_id } })
    end
    backend.track(options)
  end

  def track_user_creation(resource, guest_id)
    @user = resource
    mixpanel_alias(guest_id)
    identify
    track({ user_id: user.id, event: 'New member' })
  end

  def track_user_update(resource, guest_id)
    @user = resource
    identify
    track({ user_id: user.id, event: 'User updated' })
  end

  def track_user_sign_in(resource)
    @user = resource
    identify
    track({ user_id: user.id, event: 'Logged in', properties: { last_logged_in: DateTime.now } })
  end

  private

  attr_reader :user, :client_id, :guest_id

  def mixpanel_alias(guest_id)
    backend.alias(previous_id: guest_id, user_id: user.id)
  end

  def identify
    backend.identify(identify_params)
  end

  def identify_params
    {
      user_id: user.id,
      traits: user_traits
    }
  end

  def user_traits
    {
      name: user.name,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      plan: user.subscription.plan_id
    }.reject { |key, value| value.blank? }
  end

end
