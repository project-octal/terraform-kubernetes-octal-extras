

##### Enabling Cluster Debug
`PUT _cluster/settings`
```json
{
  "persistent" : {
    "logger.org.elasticsearch": "DEBUG",
    "logger.org.elasticsearch.deprecation" : "ERROR",
    "logger.opendistro_security.level": "trace"
  }
}
```