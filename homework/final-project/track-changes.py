# requires google diff match patch module to use this script
import diff_match_patch
import sys

f=open(sys.argv[1],'r')
first_text=f.read()
f.close()

g=open(sys.argv[2],'r')
second_text=g.read()
g.close()

dmp = diff_match_patch.diff_match_patch()
diffs = dmp.diff_main(first_text,second_text)
dmp.diff_cleanupSemantic(diffs)
htmlSnippet = dmp.diff_prettyHtml(diffs)

h=open(sys.argv[3],'w')
h.write(htmlSnippet)
h.close()
