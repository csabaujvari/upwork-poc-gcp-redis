#!/usr/bin/env bash

set -o errexit
set -o pipefail

main() {
    __print_values
    __validate
    __build_image
    __deploy
}

__print_values() {
    echo ""
    echo "Printing selected values..."
    echo "PROJECT_ID: ${PROJECT_ID}"
    echo "CONTEXT_NAME: ${CONTEXT_NAME}"
    echo "NAMESPACE: ${NAMESPACE}"
}

__validate() {
    echo ""
    echo "Parameter validation is running..."
    echo "Project ID validation..."
    __is_empty "${PROJECT_ID}"
    echo "OK!"
    echo "Context validation..."
    __is_empty "${CONTEXT_NAME}"
    echo "OK!"
    echo "Namespace validation..."
    __is_empty "${NAMESPACE}"
    echo "OK!"
}

__build_image() {
    echo ""
    echo "Building image..."
    docker build -f ./Dockerfile -t gcr.io/${PROJECT_ID}/app:latest .
    docker push gcr.io/${PROJECT_ID}/app:latest
    echo "OK!"
}

__deploy() {
    echo ""
    echo "Building image..."
    kubectl apply -f k8s.yaml -n ${NAMESPACE}
    echo "OK!"
}

__is_empty() {
    if [[ -z "$1" ]]
    then
        echo "Parameter is emtpy!"
        exit 1
    fi
}

main "$@"
