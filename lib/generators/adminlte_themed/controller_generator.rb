 require 'generators/adminlte_themed/generator_helpers'
# include Rails::Generators::ResourceHelpers
# include Adminlte::Generators::GeneratorHelpers

module AdminlteThemed
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include AdminlteThemed::Generators::GeneratorHelpers

      source_root File.expand_path("../templates", __FILE__)            	
      
      desc "Generates controller, controller_spec and views for the model with the given NAME."
      
      class_option :skip_show, type: :boolean, default: false, desc: "Skip \"show\" action"
      class_option :skip_devise, type: :boolean, default: false, desc: "Skip \"devise\" module"

      def copy_controller_files
        template "controller.rb", File.join("app/controllers", "#{controller_file_name}_controller.rb")
      end
    end
  end
end