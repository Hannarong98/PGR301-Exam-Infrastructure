### PGR301-Exam-Infrastructure

[![Build Status](https://travis-ci.com/Hannarong98/PGR301-Exam-Infrastructure.svg?token=DqMpxq41VWvgzW8Fy3oq&branch=master)](https://travis-ci.com/Hannarong98/PGR301-Exam-Infrastructure) <a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=5749379&Days=1&Design=3" /></a>

#### Encrypt secrets
* `travis encrypt-file --pro terraform-credentals.json --add`
* `travis encrypt --pro LOGZ_TOKEN="YOUR_LOGZ_IO_TOKEN"  --add`
* `travis encrypt --pro LOGZ_TOKEN="YOUR_LOGZ_IO_LISTENER_URL" --add`
* `travis encrypt --pro STATUS_CAKE_API_KEY="YOUR_STATUS_CAKE_API_KEY" --add`
