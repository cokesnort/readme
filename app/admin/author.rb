ActiveAdmin.register Author do
  form do |f|
    f.semantic_errors
    inputs 'Author details' do
      input :first_name
      input :last_name
      input :email
      input :author_type, as: :select, collection: Author.types_for_select
    end

    f.submit
  end

  permit_params %i(first_name last_name email author_type)
end
