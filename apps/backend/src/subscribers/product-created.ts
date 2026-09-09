import { SubscriberArgs, SubscriberConfig } from "@medusajs/framework"

export default async function productCreatedHandler({ event }: SubscriberArgs) {
  console.log(`✅ WORKER TEST: Product created event received - ${JSON.stringify(event.data)}`)
}

export const config: SubscriberConfig = {
  event: "product.created",
}
