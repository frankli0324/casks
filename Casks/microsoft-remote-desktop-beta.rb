cask 'microsoft-remote-desktop-beta' do
  version :latest
  sha256 :no_check

  url do
    require 'net/http'
    require 'json'
    base = URI(
      'https://install.appcenter.ms/api/v0.1/apps' \
      '/rdmacios-k2vy/microsoft-remote-desktop-for-mac' \
      '/distribution_groups/all-users-of-microsoft-remote-desktop-for-mac' \
      '/releases/latest',
    )
    JSON.parse(Net::HTTP.get(base))['download_url']
  end
  appcast 'https://api.appcenter.ms/v0.1/public/sparkle/apps/5e0c1442-89a5-1fca-2d3b-fa39ce7f2b06'
  name 'Microsoft Remote Desktop Beta'
  homepage 'https://install.appcenter.ms/orgs/rdmacios-k2vy/apps/microsoft-remote-desktop-for-mac/distribution_groups/all-users-of-microsoft-remote-desktop-for-mac'

  auto_updates true

  app 'Microsoft Remote Desktop Beta.app'

  zap trash: [
               '~/Library/Preferences/com.microsoft.rdc.osx.beta',
               '~/Library/Caches/com.microsoft.rdc.osx.beta',
               '~/Library/Application Support/com.microsoft.rdc.osx.beta',
               '~/Library/Logs/Microsoft Remote Desktop Beta',
               '~/Library/Application Support/Microsoft Remote Desktop Beta',
             ]
end
