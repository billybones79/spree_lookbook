module Spree
  class KitsController < Spree::StoreController
    respond_to :js, :html
    before_action :find_taxon
    def show

      if params[:slug]
        @lookbook = Spree::Lookbook.friendly.find(params[:slug])
      else
        @lookbook = Spree::Lookbook.joins(:kits).order(created_at: :desc).first
      end
      if params[:kit]
        @kit = @lookbook.kits.friendly.find(params[:kit])
      else
        @kit = @lookbook.kits.first
      end

      if request.path != show_kit_path(@taxon, @lookbook, @kit)
        redirect_to show_kit_path(@taxon, @lookbook, @kit), :status => :moved_permanently and return
      end
    end

    private
    def find_taxon
      @taxon = Spree::Taxon.friendly.find(params[:taxon])
    end

  end
end