# frozen_string_literal: true

# Application level helpers are written here
module ApplicationHelper
  def link_to_add_fields(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', form: builder)
    end
    link_to(
      name, '#',
      class: 'float-right add_employment_fields xl:inline-flex items-center text-white bg-blue-400 hover:bg-blue-500 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2 text-center',
      data: { id: id, fields: fields.gsub("\n", ''), action: 'people#add_employment_fields' }
    )
  end
end
