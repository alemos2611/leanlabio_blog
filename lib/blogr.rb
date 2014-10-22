require "blogr/engine"

require "bcrypt"
require "jquery-rails"
require "sass-rails"
require "bootstrap-sass"
require 'fog'
require "mini_magick"
require 'carrierwave'
require 'medium-editor-rails'
require 'gibbon'


module Blogr
  mattr_accessor :meta_title, :meta_description, :meta_keywords
end
