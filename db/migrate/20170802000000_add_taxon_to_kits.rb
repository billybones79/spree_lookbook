class AddTaxonToKits < ActiveRecord::Migration

  def change
    add_reference :spree_kit, :spree_taxon
  end

end