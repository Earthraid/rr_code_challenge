defmodule Data.PortfolioManagementTest do
  use RrCodeChallengeWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  describe "grant_user_access_to_customer_folder/2" do
    test "assert user can't get access to another customer's folder" do
    end

    test "assert no duplicates" do
    end

    test "assert user gets access to new folder" do
    end
  end

  describe "list_vendors_available_to_user/1" do
    test "assert user only has access to vendors he has access to via folder structure" do
    end
  end
end
