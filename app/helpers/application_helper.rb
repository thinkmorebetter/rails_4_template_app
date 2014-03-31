module ApplicationHelper
  def title
    base_title = 'Rails 4 Template App'
    @page_title.nil? ? base_title : "#{@page_title} | #{base_title}"
  end
  
  def description
    base_description = ''
    @page_description.nil? ? base_description : @page_description
  end
end
