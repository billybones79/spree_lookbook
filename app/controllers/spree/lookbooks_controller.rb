module Spree
  class LookbooksController < Spree::StoreController
    respond_to :js, :html
    before_action :find_taxon
    def show
      if params[:slug]
        @lookbook = Spree::Lookbook.friendly.find(params[:slug])
      else
        @lookbook = Spree::Lookbook.joins(:kits).order(created_at: :desc).first
      end
        @kit = @lookbook.kits.first
      if request.path != show_lookbook_path(@taxon, @lookbook)
         redirect_to show_lookbook_path(@taxon, @lookbook), :status => :moved_permanently and return
      end
    end

    def index
      @lookbooks = Spree::Lookbook.joins(:kits).where("spree_taxon_id"=> @taxon.self_and_descendants.pluck(:id) ).uniq
    end

    private
    def find_taxon
      @taxon = Spree::Taxon.friendly.find(params[:taxon])
    end
  end
end