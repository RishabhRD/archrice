import subprocess

from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821
c = c  # type: ConfigContainer # noqa: F821
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')
c.colors.statusbar.normal.bg = xresources['*.background']
c.url.start_pages = ["https://www.google.com"]
c.url.searchengines={"DEFAULT": "https://www.google.com/search?hl=en&q={}", "wa": "https://wiki.archlinux.org/?search={}","yt":"http://www.youtube.com/results?search_query={}","w":"https://en.wikipedia.org/w/index.php?search={}&title=Special:Search","gt":"https://github.com/search?q={}","fb":"https://www.facebook.com/search/top/?q={}"}
