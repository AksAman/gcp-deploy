## Image Comparisons

### Size
---
|  Config       | No Alpine | Alpine   |
|---------------|-----------|----------|
| No Distroless |  1.01GB   |381.13MB  |
| Distroless    |  9.47MB   | 9.47MB   |
---

### Works with `CGO_ENABLED=1`
|  Config       | No Alpine | Alpine   |
|---------------|-----------|----------|
| No Distroless |  YES      |    YES   |
| Distroless    |   NO      |    NO    |


# Loadtest results

## Cloud Function

```bash
https://{URL}/gogcp-all


Summary:
  Total:        8.0502 secs
  Slowest:      5.6557 secs
  Fastest:      0.2379 secs
  Average:      0.6093 secs
  Requests/sec: 1242.2126
  
  Total data:   960202 bytes
  Size/request: 96 bytes

Response time histogram:
  0.238 [1]     |
  0.780 [8133]  |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  1.321 [817]   |■■■■
  1.863 [501]   |■■
  2.405 [360]   |■■
  2.947 [105]   |■
  3.489 [52]    |
  4.030 [17]    |
  4.572 [2]     |
  5.114 [5]     |
  5.656 [7]     |


Latency distribution:
  10% in 0.3006 secs
  25% in 0.3324 secs
  50% in 0.3841 secs
  75% in 0.5971 secs
  90% in 1.4072 secs
  95% in 1.9063 secs
  99% in 2.8059 secs

Details (average, fastest, slowest):
  DNS+dialup:   0.0424 secs, 0.2379 secs, 5.6557 secs
  DNS-lookup:   0.0196 secs, 0.0000 secs, 0.2972 secs
  req write:    0.0001 secs, 0.0000 secs, 0.0055 secs
  resp wait:    0.4350 secs, 0.2376 secs, 3.9747 secs
  resp read:    0.0001 secs, 0.0000 secs, 0.0047 secs

Status code distribution:
  [200] 9999 responses
  [503] 1 responses
```

## Cloud Run

```bash
https://{URL}/api/users

Summary:
  Total:        6.7637 secs
  Slowest:      3.9146 secs
  Fastest:      0.2399 secs
  Average:      0.5158 secs
  Requests/sec: 1478.4719
  
  Total data:   960000 bytes
  Size/request: 96 bytes

Response time histogram:
  0.240 [1]     |
  0.607 [8129]  |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.975 [656]   |■■■
  1.342 [505]   |■■
  1.710 [389]   |■■
  2.077 [180]   |■
  2.445 [72]    |
  2.812 [43]    |
  3.180 [12]    |
  3.547 [6]     |
  3.915 [7]     |


Latency distribution:
  10% in 0.2666 secs
  25% in 0.2833 secs
  50% in 0.3674 secs
  75% in 0.4676 secs
  90% in 1.0801 secs
  95% in 1.5017 secs
  99% in 2.2410 secs

Details (average, fastest, slowest):
  DNS+dialup:   0.0470 secs, 0.2399 secs, 3.9146 secs
  DNS-lookup:   0.0166 secs, 0.0000 secs, 0.2521 secs
  req write:    0.0000 secs, 0.0000 secs, 0.0074 secs
  resp wait:    0.3931 secs, 0.2397 secs, 3.1492 secs
  resp read:    0.0001 secs, 0.0000 secs, 0.0060 secs

Status code distribution:
  [200] 10000 responses
```