#!/usr/bin/env bash

# This script contains metadata that is either used in other scripts or expanded
# into templates via `tools/compile_templates.sh`.

# "Shadowing" these two environment variables so that they don't affect
# similarly named environment variables in other scripts loading this script.
_script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
_project_directory="$(realpath -L "${_script_directory}")"

################################################################################
################################# Operator #####################################
################################################################################

# https://github.com/mesosphere/kudo-postgres-operator

export PROJECT_NAME="kudo-postgres-operator"
export OPERATOR_NAME="postgres"

# More details about KUDO Versioning:
# https://github.com/kudobuilder/kudo/pull/1028
# NOTE: Keep the version in tests in sync, see https://github.com/mesosphere/kudo-cassandra-operator/issues/136
export OPERATOR_VERSION="0.0.1"

# This should be an empty string on stable branches and "-SNAPSHOT" on
# non-stable branches.
export POSSIBLE_SNAPSHOT_SUFFIX=""

export OPERATOR_DIRECTORY="${_project_directory}/operator"
export VENDOR_DIRECTORY="${_project_directory}/shared/vendor"

################################################################################
############################### Dependencies ###################################
################################################################################


# https://www.postgresql.org/
export POSTGRES_VERSION="12.3"

# https://github.com/sorintlab/stolon
export STOLON_VERSION="0.16.0"

# https://github.com/kudobuilder/kudo/releases/tag/vx.y.z
export KUDO_VERSION="0.15.0"
export KUBERNETES_VERSION="1.16.0"

#export RECOVERY_CONTROLLER_VERSION="0.0.2"

################################################################################
############################## Docker images ###################################
################################################################################

export STOLON_DOCKER_IMAGE="sorintlab/stolon:master-pg10"

#export CASSANDRA_DOCKER_IMAGE_FROM="cassandra:${CASSANDRA_VERSION}"
#export CASSANDRA_DOCKER_IMAGE_NAMESPACE="mesosphere"
#export CASSANDRA_DOCKER_IMAGE_NAME="${OPERATOR_NAME}"
#export CASSANDRA_DOCKER_IMAGE_TAG="${CASSANDRA_VERSION}-${OPERATOR_VERSION}${POSSIBLE_SNAPSHOT_SUFFIX}${IMAGE_DISAMBIGUATION_SUFFIX:-}"
#export CASSANDRA_DOCKER_IMAGE="${CASSANDRA_DOCKER_IMAGE_NAMESPACE}/${CASSANDRA_DOCKER_IMAGE_NAME}:${CASSANDRA_DOCKER_IMAGE_TAG}"

#export PROMETHEUS_EXPORTER_DOCKER_IMAGE_FROM="${CASSANDRA_EXPORTER_DOCKER_IMAGE}:${CASSANDRA_EXPORTER_VERSION}"
#export PROMETHEUS_EXPORTER_DOCKER_IMAGE_NAMESPACE="mesosphere"
#export PROMETHEUS_EXPORTER_DOCKER_IMAGE_NAME="cassandra-prometheus-exporter"
#export PROMETHEUS_EXPORTER_DOCKER_IMAGE_TAG="${CASSANDRA_EXPORTER_VERSION}-${OPERATOR_VERSION}${POSSIBLE_SNAPSHOT_SUFFIX}${IMAGE_DISAMBIGUATION_SUFFIX:-}"
#export PROMETHEUS_EXPORTER_DOCKER_IMAGE="${PROMETHEUS_EXPORTER_DOCKER_IMAGE_NAMESPACE}/${PROMETHEUS_EXPORTER_DOCKER_IMAGE_NAME}:${PROMETHEUS_EXPORTER_DOCKER_IMAGE_TAG}"
export PROMETHEUS_EXPORTER_DOCKER_IMAGE="wrouesnel/postgres_exporter:v0.8.0"

#export MEDUSA_BACKUP_DOCKER_IMAGE_FROM="cassandra:${CASSANDRA_VERSION}"
#export MEDUSA_BACKUP_DOCKER_IMAGE_NAMESPACE="mesosphere"
#export MEDUSA_BACKUP_DOCKER_IMAGE_NAME="kudo-cassandra-medusa"
#export MEDUSA_BACKUP_DOCKER_IMAGE_TAG="${MEDUSA_BACKUP_VERSION}-${OPERATOR_VERSION}${POSSIBLE_SNAPSHOT_SUFFIX}${IMAGE_DISAMBIGUATION_SUFFIX:-}"
#export MEDUSA_BACKUP_DOCKER_IMAGE="${MEDUSA_BACKUP_DOCKER_IMAGE_NAMESPACE}/${MEDUSA_BACKUP_DOCKER_IMAGE_NAME}:${MEDUSA_BACKUP_DOCKER_IMAGE_TAG}"
#
#export RECOVERY_CONTROLLER_DOCKER_IMAGE_NAMESPACE="mesosphere"
#export RECOVERY_CONTROLLER_DOCKER_IMAGE_NAME="kudo-cassandra-recovery"
#export RECOVERY_CONTROLLER_DOCKER_IMAGE_TAG="${RECOVERY_CONTROLLER_VERSION}-${OPERATOR_VERSION}${POSSIBLE_SNAPSHOT_SUFFIX}${IMAGE_DISAMBIGUATION_SUFFIX:-}"
#export RECOVERY_CONTROLLER_DOCKER_IMAGE="${RECOVERY_CONTROLLER_DOCKER_IMAGE_NAMESPACE}/${RECOVERY_CONTROLLER_DOCKER_IMAGE_NAME}:${RECOVERY_CONTROLLER_DOCKER_IMAGE_TAG}"

################################################################################
################################# Testing ######################################
################################################################################

# TODO: Add Image that has psql installed
export INTEGRATION_TESTS_DOCKER_IMAGE_FROM="golang:1.13.1-stretch"
export INTEGRATION_TESTS_DOCKER_IMAGE_NAMESPACE="mesosphere"
export INTEGRATION_TESTS_DOCKER_IMAGE_NAME="kudo-postgres-tests"
export INTEGRATION_TESTS_DOCKER_IMAGE_TAG="latest${IMAGE_DISAMBIGUATION_SUFFIX:-}"
export INTEGRATION_TESTS_DOCKER_IMAGE="${INTEGRATION_TESTS_DOCKER_IMAGE_NAMESPACE}/${INTEGRATION_TESTS_DOCKER_IMAGE_NAME}:${INTEGRATION_TESTS_DOCKER_IMAGE_TAG}"

################################################################################
############################# Data Services ####################################
################################################################################

# DS_KUDO_VERSION is used by the shared data-services-kudo tooling.
# DS_KUDO_VERSION *may* be set by TeamCity Jobs if a fixed KUDO version is preferred for the test execution
# If not DS_KUDO_VERSION is set, we use and install the required KUDO version from the operator
export DS_KUDO_VERSION="${DS_KUDO_VERSION:-v${KUDO_VERSION}}"
