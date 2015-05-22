module FixtureHelper
  def uniara_virtual_fixture(filename)
    File.open("./spec/fixtures/uniara_virtual/#{filename}")
  end
end
