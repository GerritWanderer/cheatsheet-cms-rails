module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new account page/
      new_user_registration_path
    when /the logout page/
      destroy_user_session_path
    when /the redisplayed new account page/
      user_registration_path
    when /the create cheatsheet page/
      new_sheet_path
    when /the edit cheatsheet page/
      edit_sheet_path
    when /the cheatsheets page/
      sheets_path
    when /the cheatsheet page/
      sheet_path
    when /the create sheetcategory page/
      new_sheet_category_path
    when /the edit sheetcategory page/
      edit_sheet_category_path
    when /the sheetcategories page/
      sheet_categories_path
    when /the sheetcategory page/
      sheet_category_path

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
