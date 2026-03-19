helm upgrade --install defectdojo defectdojo/defectdojo -n defectdojo --create-namespace \
  -f values-dojo.yaml \
  --set createSecret=true \
  --set createValkeySecret=true \
  --set createPostgresqlSecret=true \
  --set django.ingress.enabled=false