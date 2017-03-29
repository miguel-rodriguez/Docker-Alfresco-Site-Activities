curl -XPUT 'localhost:9200/logstash-activities-2017.01.01?pretty' -H 'Content-Type: application/json' -d'
{
    "mappings": {
      "_default_": {
        "_all": {
          "enabled": true,
          "norms": false
        },
        "dynamic_templates": [
          {
            "message_field": {
              "path_match": "message",
              "match_mapping_type": "string",
              "mapping": {
                "norms": false,
                "type": "text"
              }
            }
          },
          {
            "string_fields": {
              "match": "*",
              "match_mapping_type": "string",
              "mapping": {
                "fields": {
                  "keyword": {
                    "type": "keyword"
                  }
                },
                "norms": false,
                "type": "text"
              }
            }
          }
        ],
        "properties": {
          "@timestamp": {
            "type": "date",
            "include_in_all": false
          },
          "@version": {
            "type": "keyword",
            "include_in_all": false
          },
          "geoip": {
            "dynamic": "true",
            "properties": {
              "ip": {
                "type": "ip"
              },
              "latitude": {
                "type": "half_float"
              },
              "location": {
                "type": "geo_point"
              },
              "longitude": {
                "type": "half_float"
              }
            }
          }
        }
      },
      "logs": {
        "_all": {
          "enabled": true,
          "norms": false
        },
        "dynamic_templates": [
          {
            "message_field": {
              "path_match": "message",
              "match_mapping_type": "string",
              "mapping": {
                "norms": false,
                "type": "text"
              }
            }
          },
          {
            "string_fields": {
              "match": "*",
              "match_mapping_type": "string",
              "mapping": {
                "fields": {
                  "keyword": {
                    "type": "keyword"
                  }
                },
                "norms": false,
                "type": "text"
              }
            }
          }
        ],
        "properties": {
          "@timestamp": {
            "type": "date",
            "include_in_all": false
          },
          "@version": {
            "type": "keyword",
            "include_in_all": false
          },
          "command": {
            "type": "text",
            "norms": false,
            "fields": {
              "keyword": {
                "type": "keyword"
              }
            }
          },
          "geoip": {
            "dynamic": "true",
            "properties": {
              "ip": {
                "type": "ip"
              },
              "latitude": {
                "type": "half_float"
              },
              "location": {
                "type": "geo_point"
              },
              "longitude": {
                "type": "half_float"
              }
            }
          },
          "host": {
            "type": "text",
            "norms": false,
            "fields": {
              "keyword": {
                "type": "keyword"
              }
            }
          }
        }
      }
    }
  }
'
