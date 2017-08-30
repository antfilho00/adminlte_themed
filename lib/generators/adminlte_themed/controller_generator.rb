 require 'generators/adminlte_themed/generator_helpers'
# include Rails::Generators::ResourceHelpers
# include Adminlte::Generators::GeneratorHelpers

module AdminlteThemed
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include AdminlteThemed::Generators::GeneratorHelpers

      source_root File.expand_path("../templates", __FILE__)            	
      
      desc "Generates controller and views for the model with the given NAME."
      
      class_option :skip_views, type: :boolean, default: false, desc: "Skipping \"Views\" config", aliases: :sv
      class_option :with_kaminari, type: :boolean, default: false, desc: "Add \"kaminari\" config", aliases: :k
      class_option :with_devise, type: :boolean, default: false, desc: "Add \"devise\" config", aliases: :d
      class_option :with_breadcrumb, type: :boolean, default: false, desc: "Add \"breadcrumb\" config", aliases: :b

      def copy_controller_files
        template "controller.rb", File.join("app/controllers", "#{controller_file_name}_controller.rb")
      end

      def copy_view_files
        if !options[:skip_views]
          directory_path = File.join("app/views", controller_file_path)
          empty_directory directory_path

          view_files.each do |file_name|
            template "views/#{file_name}.html.erb", File.join(directory_path, "#{file_name}.html.erb")
          end
        end
      end

      # def inject_breadcrump
      #   inject_into_file File.join("app/controllers", "application_controller.rb"), after: "protect_from_forgery with: :exception" do 
      #     "\n Hello World \n \n"
      #   end
      # end

    end
  end
end