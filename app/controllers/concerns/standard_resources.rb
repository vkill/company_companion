module StandardResources

  extend ActiveSupport::Concern

  included do
    build_name_methods self.name

    before_filter :_set_resource, only: [:show, :edit, :update, :destroy]
    before_filter :_build_attributes, only: [:create, :update]
  end

  module ClassMethods

    private

    def build_name_methods(klass_name)
      names = klass_name.underscore.split('/')
      collection_name = names.pop.sub('_controller', '')
      resource_name = collection_name.singularize
      namespaces = names
      
      define_method :collection_name do
        collection_name
      end
      define_method :resource_name do
        resource_name
      end
      define_method :namespaces do
        namespaces
      end
    end
  end


  def index
    build_collection
    respond_with *namespaces, collection
  end

  def new
    self.resource = association_chain.new
    respond_with *namespaces, resource
  end

  def create
    self.resource = association_chain.new(@attributes)
    resource.save
    respond_with *namespaces, resource, location: after_create_path
  end

  def show
    respond_with *namespaces, resource
  end

  def edit
    respond_with *namespaces, resource
  end

  def update
    resource.update_attributes(@attributes)
    respond_with *namespaces, resource, location: after_update_path
  end

  def destroy
    resource.destroy
    respond_with *namespaces, resource, location: after_destroy_path
  end


  private

  # custom
  def accessible_attributes
    []
  end

  def association_chain
    resource_name.classify.constantize
  end

  def set_resource
    self.resource = association_chain.find(params[:id])
  end
  alias_method :_set_resource, :set_resource

  def build_attributes
    @attributes = params.require(resource_name).permit(*Array(accessible_attributes))
  end
  alias_method :_build_attributes, :build_attributes

  def build_collection
    self.collection = association_chain.page(params[:page]).per(params[:per_page])
  end

  def after_create_path
    namespaces + [resource]
  end

  def after_update_path
    namespaces + [resource]
  end

  def after_destroy_path
    namespaces + [collection_name]
  end


  # 
  def resource_variable
    '@%s' % resource_name
  end

  def resource
    instance_variable_get(resource_variable)
  end

  def resource=(record)
    instance_variable_set(resource_variable, record)
  end

  def collection_variable
    '@%s' % collection_name
  end

  def collection
    instance_variable_get(collection_variable)
  end

  def collection=(records)
    instance_variable_set(collection_variable, records)
  end 


end