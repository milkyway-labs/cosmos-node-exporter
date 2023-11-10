package constants

import (
	"regexp"
	"time"
)

const (
	MetricsPrefix           = "cosmos_node_exporter_"
	UncachedGithubQueryTime = 30 * time.Second
)

var (
	GithubRegexp  = regexp.MustCompile("https://github.com/(?P<Org>[a-zA-Z0-9-].*)/(?P<Repo>[a-zA-Z0-9-].*)")
	GitopiaRegexp = regexp.MustCompile("gitopia://(?P<Org>[a-zA-Z0-9-].*)/(?P<Repo>[a-zA-Z0-9-].*)")
)
