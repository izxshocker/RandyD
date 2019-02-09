require "application_system_test_case"

class TracksTest < ApplicationSystemTestCase
  setup do
    @track = tracks(:one)
  end

  test "visiting the index" do
    visit tracks_url
    assert_selector "h1", text: "Tracks"
  end

  test "creating a Track" do
    visit tracks_url
    click_on "New Track"

    fill_in "Notes", with: @track.notes
    fill_in "Player", with: @track.player_id
    fill_in "Raided", with: @track.raided
    fill_in "X", with: @track.x
    fill_in "Xmax", with: @track.xMax
    fill_in "Xmin", with: @track.xMin
    fill_in "Xminn", with: @track.xMinN
    fill_in "Xn", with: @track.xN
    fill_in "Xp", with: @track.xP
    fill_in "Xpn", with: @track.xPN
    fill_in "Z", with: @track.z
    fill_in "Zmax", with: @track.zMax
    fill_in "Zmaxn", with: @track.zMaxN
    fill_in "Zmin", with: @track.zMin
    fill_in "Zminn", with: @track.zMinN
    fill_in "Zn", with: @track.zN
    fill_in "Zp", with: @track.zP
    fill_in "Zpn", with: @track.zPN
    click_on "Create Track"

    assert_text "Track was successfully created"
    click_on "Back"
  end

  test "updating a Track" do
    visit tracks_url
    click_on "Edit", match: :first

    fill_in "Notes", with: @track.notes
    fill_in "Player", with: @track.player_id
    fill_in "Raided", with: @track.raided
    fill_in "X", with: @track.x
    fill_in "Xmax", with: @track.xMax
    fill_in "Xmin", with: @track.xMin
    fill_in "Xminn", with: @track.xMinN
    fill_in "Xn", with: @track.xN
    fill_in "Xp", with: @track.xP
    fill_in "Xpn", with: @track.xPN
    fill_in "Z", with: @track.z
    fill_in "Zmax", with: @track.zMax
    fill_in "Zmaxn", with: @track.zMaxN
    fill_in "Zmin", with: @track.zMin
    fill_in "Zminn", with: @track.zMinN
    fill_in "Zn", with: @track.zN
    fill_in "Zp", with: @track.zP
    fill_in "Zpn", with: @track.zPN
    click_on "Update Track"

    assert_text "Track was successfully updated"
    click_on "Back"
  end

  test "destroying a Track" do
    visit tracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Track was successfully destroyed"
  end
end
