"""create_app(): the plugin runtime hosting the echo adapter (service `echo`)."""

from aab_plugin_runtime import from_env

from .adapter import EchoAdapter


def create_app():
    return from_env([EchoAdapter()], service="echo")
