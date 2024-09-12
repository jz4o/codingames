# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
m = gets.to_i
invoices = []
n.times do
  invoice = gets.to_i
  invoices << invoice
end
payment_entries = []
m.times do
  payment_entry = gets.to_i
  payment_entries << payment_entry
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class LabeledPayment
  attr_reader :payment
  attr_writer :invoices

  def initialize(label, payment)
    @label = label
    @payment = payment
    @invoices = []
  end

  def matched?
    @invoices.any?
  end

  def to_s
    [@label, @payment, '-', *@invoices].join ' '
  end
end

labels = ('A'..'Z').to_a
labeled_payments = labels[...payment_entries.size].zip(payment_entries).map do |label, payment|
  LabeledPayment.new label, payment
end

invoice_stack = []
invoices.each do |invoice|
  invoice_stack << invoice
  sum_invoice = invoice_stack.sum

  matched_payment = labeled_payments.find do |labeled_payment|
    !labeled_payment.matched? && labeled_payment.payment == sum_invoice
  end
  next unless matched_payment

  matched_payment.invoices = invoice_stack.dup
  invoice_stack.clear
end

results = labeled_payments.map(&:to_s)

# puts "answer"
results.each do |result|
  puts result
end
