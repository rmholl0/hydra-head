class GenericContent < ActiveFedora::Base

  # Uses the Hydra Rights Metadata Schema for tracking access permissions & copyright
  has_metadata :name => "rightsMetadata", :type => Hydra::Datastream::RightsMetadata 

  include Hydra::GenericContent
  has_metadata :name => "descMetadata", :type => Hydra::Datastream::ModsGenericContent

  # A place to put extra metadata values
  has_metadata :name => "properties", :type => Hydra::Datastream::Properties
  
  # adds helpful methods for basic hydra objects.  
  # FIXME:  redundate with  GenericContent include above??
  include Hydra::ModelMethods
  
  def initialize( attrs={} )
    super
  end
end
