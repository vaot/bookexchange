module Filter
  class Books

    FILTERS = %w(popular recent)

    def initialize(user, params)
      @user = user
      @tags_string = params[:tags]
      @page = params[:page] || 1
      @per_page = 6
      @filter = FILTERS.include?(params[:filter]) ? params[:filter] : nil
    end

    def filtered
      @filtered ||=
        if @filter.present?
          scoped.send(@filter).includes(:cover)
        else
          scoped.includes(:cover)
        end
    end

    def scoped
      if @user.present?
        @user.books.paginate(page: @page, per_page: @per_page)
      else
        if current_tags.present?
          Book.scope_by_tags(current_tags).paginate(page: @page, per_page: @per_page)
        else
          Book.public.paginate(page: @page, per_page: @per_page)
        end
      end
    end

    private

    def current_tags
      @current_tags ||= (@tags_string || "").split(",").map { |tag| tag.strip }
    end
  end
end
