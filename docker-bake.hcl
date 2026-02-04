group "default" {
  targets = ["engine", "postgres"]
}

target "engine" {
  dockerfile = "stack/ops/engine.Dockerfile"
  tags = ["orglang/go-engine:latest"]
  context = "."
}

target "postgres" {
  dockerfile = "liquibase.Dockerfile"
  tags = ["orglang/pg-operator:latest"]
  context = "go-runtime/db/postgres"
}
