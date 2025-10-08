# import sys
# import math

import string

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
m = int(input())
invoices = []
for _ in range(n):
    invoice = int(input())
    invoices.append(invoice)
payment_entries = []
for _ in range(m):
    payment_entry = int(input())
    payment_entries.append(payment_entry)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class LabeledPayment:
    def __init__(self, label, payment):
        self.label = label
        self.payment = payment
        self.invoices = []

    def is_matched(self):
        return len(self.invoices) > 0

    def __str__(self):
        return ' '.join([
            self.label,
            str(self.payment),
            '-',
            *[str(invoice) for invoice in self.invoices],
        ])

labeled_payments = [
    LabeledPayment(label, payment)
    for label, payment
    in zip(string.ascii_uppercase[:len(payment_entries)], payment_entries, strict=True)
]

invoice_stack = []
for invoice in invoices:
    invoice_stack.append(invoice)
    sum_invoice = sum(invoice_stack)

    matched_payment = next(iter([
        labeled_payment
        for labeled_payment
        in labeled_payments
        if not labeled_payment.is_matched() and labeled_payment.payment == sum_invoice
    ]), None)
    if matched_payment is None:
        continue

    matched_payment.invoices = [*invoice_stack]
    invoice_stack.clear()

results = [str(labeled_payment) for labeled_payment in labeled_payments]

# print("answer")
for result in results:
    print(result)
