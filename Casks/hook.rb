cask 'hook' do
  version :latest
  sha256 :no_check

  # install.appcenter.ms was verified as official when first introduced to the cask
  url do
    require 'net/http'
    require 'json'
    base = URI(
      'https://install.appcenter.ms/api/v0.1/apps' \
      '/cogsci-apps/hook/distribution_groups' \
      '/hook%20productivity%20app%20general%20availability' \
      '/releases/latest'
    )
    JSON.parse(Net::HTTP.get(base))['download_url']
  end
  appcast 'https://api.appcenter.ms/v0.1/public/sparkle/apps/a77a1a87-7d69-435d-90ea-7365b2f7bddb'
  name 'Hook'
  homepage 'https://hookproductivity.com/'

  auto_updates true
  depends_on macos: '>= :sierra'

  app 'Hook.app'

  uninstall launchctl: 'com.cogsciapps.hookautolaunchhelper',
            quit:      'com.cogsciapps.hook'

  zap trash:
             [
               '~/Library/Caches/com.cogsciapps.hook',
               '~/Library/Logs/com.cogsciapps.hook',
               '~/Library/Preferences/com.cogsciapps.hook.plist',
             ]
end
