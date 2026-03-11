# Walkthrough: Travel Invoice Report Enhancement (Qty/Price Visibility)

**Date**: 2026-03-10
**Task**: Enable Quantity and Unit Price display in Travel Invoice PDF, Excel, and IRN payloads.

## Step 1: Update Assembler
Modify `api/src/services/travelInvoiceAssembler.ts` to:
1. Extend `TravelInvoicePrintDTO` with `poQuantity` and `poUnitPrice`.
2. Extract `unitPrice` from the Purchase Order's Travel Item.
3. Calculate `poQuantity = subtotal / poUnitPrice`.

## Step 2: Update PDF Service
Modify `api/src/services/travelPdfService.ts` to:
1. Set `hideQuantityColumn: false`.
2. Map `dto.poQuantity` and `dto.poUnitPrice` into the `items` array for rendering.

## Step 3: Update IRN Payload Builder
Modify `api/src/services/irnPayloadBuilder.ts` to:
1. Extract actual `quantity` and `unitPrice` values from the `travelInvoice` or re-calculate them using the same logic as the assembler to ensure consistency.
2. Replace hardcoded `Qty: 1` and `UnitPrice: subtotal` with these dynamic values.

## Step 4: Verification
1. Run `api/tests/pdfRenderer.test.ts`.
2. Update Governance Hub files.
