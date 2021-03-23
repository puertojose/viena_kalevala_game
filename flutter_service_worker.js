'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/NOTICES": "1f3bb9300200300cc41a401cc2b896bd",
"assets/dict.sqlite": "5442d86d044aa3fa756890c1f8e6ed27",
"assets/karelian_flag.png": "22474d018c5a3a3913d46d625186ad0d",
"assets/output3.json": "1c05ef2e8820a6ae004ec50c7fd9663b",
"assets/test.mp3": "02882ce29c39d46d8cb8c0eac28ce519",
"assets/karelian_flag.jpg": "43216a046a093b2b25a34f611a0b49aa",
"assets/taptostart.png": "aba509a4355ce1c7445d77e63638a976",
"assets/assets/dict.sqlite": "5442d86d044aa3fa756890c1f8e6ed27",
"assets/assets/karelian_flag.png": "22474d018c5a3a3913d46d625186ad0d",
"assets/assets/output3.json": "1c05ef2e8820a6ae004ec50c7fd9663b",
"assets/assets/test.mp3": "02882ce29c39d46d8cb8c0eac28ce519",
"assets/assets/karelian_flag.jpg": "43216a046a093b2b25a34f611a0b49aa",
"assets/assets/taptostart.png": "aba509a4355ce1c7445d77e63638a976",
"assets/assets/test1.csv": "b672d077fcd83408be2837bdadfc487a",
"assets/assets/taptostart2.png": "3273869ba80470d8a47a80ac2ff01722",
"assets/assets/book.jpg": "6094d2830effa4255df6cd01fcc4f04a",
"assets/assets/name2.png": "62c9125edc5b39f10039953cd6b1f2b1",
"assets/assets/kalevala1.csv": "9fb9bfdf4abaaedfc14ee3d54901949c",
"assets/assets/output4.json": "1c05ef2e8820a6ae004ec50c7fd9663b",
"assets/assets/output6.json": "ad3d4e8168807dd73d0e61947ef5f1fd",
"assets/assets/output.json": "60f64206cfc9daac41c8b1945b73d79f",
"assets/assets/coin.jpeg": "e62e53bab3699b588f7585e6e493842d",
"assets/assets/characters/sampo.png": "424da15fcf36febe7643e8f4dd88bf7e",
"assets/assets/characters/kullervo.png": "c060ece866be8a7e027bbdf4968e21cc",
"assets/assets/characters/lemminkainen.png": "d2bad4ab1b60ae3f5e1979d848816d5b",
"assets/assets/characters/marjatta.png": "4af59465c93447fd88c2f166734504f2",
"assets/assets/characters/kyllikki.png": "33e7953ba2b9452eba11e23263f1e5c3",
"assets/assets/characters/pohjolantyttaret.png": "60b5f07cc6d95e1ca4a50d7f1b95c611",
"assets/assets/characters/aino.png": "71e39ade04f38be33fa76af28fd69134",
"assets/assets/characters/lemminkaisenaiti.png": "ed9d2b4341a0fd28008ab03fa1ad47b6",
"assets/assets/characters/ilmarinen.png": "d33aa8dbf30f5061106b643534306749",
"assets/assets/characters/joukahainen.png": "e0a7c4304560739796df2fff0f766828",
"assets/assets/characters/louhi.png": "e0476d8d7091274ead348f26174f3a7c",
"assets/assets/characters/vainamoinen.png": "a68f8d70f85a1ddc9fea8fbf2bb5cdda",
"assets/assets/dictionary.json": "51d97fb6ed44f579ba9f9a8cdf0cc858",
"assets/assets/wrong.mp3": "f2c478e26c9cdb8bc681fb3074d783d8",
"assets/assets/output5.json": "4071346474f5262068606dba03ae9c09",
"assets/assets/bear.png": "3c01b6d0bc4145b28c2d93d3548e3e9f",
"assets/assets/raindeer.png": "9cc826668676d10bc872d975462dca37",
"assets/assets/karelian_flag2.png": "9a52fe4812a176df0246e211f3b2a821",
"assets/assets/cardgame.csv": "828cf22fd8ba7bf9c49893bb7a629b1e",
"assets/assets/output2.json": "d7746f3acbf2ba1c41f97788b3e1b5c2",
"assets/assets/background.jpg": "7c25416be5e145436ac951566559ea28",
"assets/assets/name.png": "1a1e5a974a84104436208466aab8921e",
"assets/test1.csv": "b672d077fcd83408be2837bdadfc487a",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/book.jpg": "6094d2830effa4255df6cd01fcc4f04a",
"assets/kalevala1.csv": "9fb9bfdf4abaaedfc14ee3d54901949c",
"assets/output4.json": "1c05ef2e8820a6ae004ec50c7fd9663b",
"assets/AssetManifest.json": "b4870781fcba2a26454ab8b9da16c01b",
"assets/characters2/6.png": "ed9d2b4341a0fd28008ab03fa1ad47b6",
"assets/characters2/5.png": "71e39ade04f38be33fa76af28fd69134",
"assets/characters2/7.png": "60b5f07cc6d95e1ca4a50d7f1b95c611",
"assets/characters2/8.png": "33e7953ba2b9452eba11e23263f1e5c3",
"assets/characters2/10.png": "d33aa8dbf30f5061106b643534306749",
"assets/characters2/11.png": "d2bad4ab1b60ae3f5e1979d848816d5b",
"assets/characters2/0.png": "424da15fcf36febe7643e8f4dd88bf7e",
"assets/characters2/3.png": "c060ece866be8a7e027bbdf4968e21cc",
"assets/characters2/4.png": "e0476d8d7091274ead348f26174f3a7c",
"assets/characters2/9.png": "a68f8d70f85a1ddc9fea8fbf2bb5cdda",
"assets/characters2/2.png": "4af59465c93447fd88c2f166734504f2",
"assets/characters2/1.png": "e0a7c4304560739796df2fff0f766828",
"assets/output6.json": "ad3d4e8168807dd73d0e61947ef5f1fd",
"assets/output.json": "60f64206cfc9daac41c8b1945b73d79f",
"assets/characters/sampo.png": "424da15fcf36febe7643e8f4dd88bf7e",
"assets/characters/kullervo.png": "c060ece866be8a7e027bbdf4968e21cc",
"assets/characters/lemminkainen.png": "d2bad4ab1b60ae3f5e1979d848816d5b",
"assets/characters/marjatta.png": "4af59465c93447fd88c2f166734504f2",
"assets/characters/kyllikki.png": "33e7953ba2b9452eba11e23263f1e5c3",
"assets/characters/pohjolantyttaret.png": "60b5f07cc6d95e1ca4a50d7f1b95c611",
"assets/characters/aino.png": "71e39ade04f38be33fa76af28fd69134",
"assets/characters/lemminkaisenaiti.png": "ed9d2b4341a0fd28008ab03fa1ad47b6",
"assets/characters/ilmarinen.png": "d33aa8dbf30f5061106b643534306749",
"assets/characters/joukahainen.png": "e0a7c4304560739796df2fff0f766828",
"assets/characters/louhi.png": "e0476d8d7091274ead348f26174f3a7c",
"assets/characters/vainamoinen.png": "a68f8d70f85a1ddc9fea8fbf2bb5cdda",
"assets/dictionary.json": "51d97fb6ed44f579ba9f9a8cdf0cc858",
"assets/wrong.mp3": "f2c478e26c9cdb8bc681fb3074d783d8",
"assets/output5.json": "4071346474f5262068606dba03ae9c09",
"assets/bear.png": "3c01b6d0bc4145b28c2d93d3548e3e9f",
"assets/raindeer.png": "9cc826668676d10bc872d975462dca37",
"assets/cardgame.csv": "828cf22fd8ba7bf9c49893bb7a629b1e",
"assets/output2.json": "d7746f3acbf2ba1c41f97788b3e1b5c2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/background.jpg": "7c25416be5e145436ac951566559ea28",
"assets/name.png": "1a1e5a974a84104436208466aab8921e",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"index.html": "4d5338e8c644a164eb79601daca69cc0",
"/": "4d5338e8c644a164eb79601daca69cc0",
"main.dart.js": "31080fb49331d26d7e8bfbe4b1140afd",
"version.json": "ab9f48814f05f47e31155436a54e054f"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
