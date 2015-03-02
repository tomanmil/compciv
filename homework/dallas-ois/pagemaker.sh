cat > report.html <<'EOF'
<html>
  <body>
  <h2>Dallas Officer-Involved Shootings</h2>
  <h3>Incidents</h3>
  <table width="90%">
EOF
csvfix printf -sep '|' -fmt "<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>" tables/incidents.psv >> report.html
cat >> report.html <<'EOF'
  </table>
  <h3>Officers</h3>
  <table width="90%">
EOF
csvfix printf -sep '|' -fmt "<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>" tables/officers.psv >> report.html
cat >> report.html <<'EOF'
  </table>
  <h3>Suspects</h3>
  <table width="90%">
EOF
csvfix printf -sep '|' -fmt "<tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr>" tables/suspects.psv >> report.html
cat >> report.html <<'EOF'
  </table>
  </body>
</html>
EOF

