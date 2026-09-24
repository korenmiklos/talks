import { NodeSDK } from "@opentelemetry/sdk-node";
import { LangfuseSpanProcessor } from "@langfuse/otel";

const configured = Boolean(process.env.LANGFUSE_PUBLIC_KEY && process.env.LANGFUSE_SECRET_KEY);
const sdk = configured ? new NodeSDK({ spanProcessors: [new LangfuseSpanProcessor()] }) : null;

if (sdk) sdk.start();

export const langfuseEnabled = configured;

export async function shutdownTelemetry() {
  if (sdk) await sdk.shutdown();
}
