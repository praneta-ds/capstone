from Market import app

# App Insights setup
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.azure.monitor import AzureMonitorTraceExporter
from opentelemetry import trace

# Application Insights connection string
connection_string = "a65bcb08-d5eb-4afd-a90b-9c76201a4461"

trace.set_tracer_provider(TracerProvider())
trace.get_tracer_provider().add_span_processor(
    BatchSpanProcessor(
        AzureMonitorTraceExporter(connection_string=connection_string)
    )
)
FlaskInstrumentor().instrument_app(app)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)
