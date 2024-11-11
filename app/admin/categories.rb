ActiveAdmin.register Category do
  menu priority: 4

  permit_params :name, :image
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, style: "height:200px") : ""
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :created_at
    column :updated_at
    column "Image" do |category|
      category.image.present? ? image_tag(category.image, style: "height:100px") : ""
    end
    actions
  end
end
