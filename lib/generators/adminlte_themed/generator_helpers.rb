module AdminlteThemed
  module Generators
    # Some helpers for generating scaffolding
    module GeneratorHelpers

      attr_accessor :options, :attributes

      private

      def with_breadcrump?
        options['with_breadcrump']
      end
      
      def with_kaminari?
        options['with_kaminari']
      end
      
      def with_devise?
        options['with_devise']
      end

      def model_exists?
        File.exist?("#{Rails.root}/app/models/#{singular_name}.rb")
      end

      def model_columns_for_attributes
        class_name.constantize.columns.reject do |column|
          column.name.to_s =~ /^(id|user_id|created_at|updated_at)$/
        end
      end

      def editable_attributes
        attributes ||= if model_exists?
                          model_columns_for_attributes.map do |column|
                            Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
                          end
                        else
                          []
                        end
      end

      def field_to_check_update
        @field_update_in_spec ||= if text_field = editable_attributes.find { |attr| attr.type == 'string' }
                                    { name: text_field.name, old_value: "'Just Text'", new_value: "'New Text'" }
                                  elsif numeric_field = editable_attributes.find { |attr| attr.type == 'integer' }
                                    { name: numeric_field.name, old_value: 1, new_value: 2 }
                                  else
                                    false
                                  end
      end

      def all_actions
        actions = %w(index new create edit show update destroy)
        actions
      end

      def view_files
        actions = %w(index new edit show _form)
        actions
      end

      def controller_methods(dir_name)
        all_actions.map do |action|
          read_template("#{dir_name}/#{action}.rb")
        end.join("\n").strip
      end

      def source_path(relative_path)
        File.expand_path(File.join("../templates/", relative_path), __FILE__)
      end

      def read_template(relative_path)
        ERB.new(File.read(source_path(relative_path)), nil, '-').result(binding)
      end
    end
  end
end