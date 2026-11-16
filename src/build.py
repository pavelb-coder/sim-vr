# Сборка index.html: вставляет библиотеки из vendor/ в src/part1_head.html
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
html = open('part1_head.html', encoding='utf-8').read()
for name in ['three.min.js', 'blockly_compressed.js', 'blocks_compressed.js', 'javascript_compressed.js', 'ru.js']:
    placeholder = '<!--INLINE:%s-->' % name
    src = open('../vendor/' + name, encoding='utf-8').read()
    assert '</script' not in src.lower(), name
    html = html.replace(placeholder, '<script>\n' + src + '\n</script>')
assert '<!--INLINE' not in html
open('../index.html', 'w', encoding='utf-8').write(html)
print('index.html OK,', len(html.encode()), 'bytes')
