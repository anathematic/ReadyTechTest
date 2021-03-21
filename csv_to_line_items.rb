# frozen_string_literal: true

module CsvToLineItems
  ALLOWED_KEYS = [:price, :product, :quantity]
  FLOAT_KEYS = [:price, :quantity]

  def self.to_line_items(csv_path)
    CSV.read(csv_path, headers: :first_row).map do |row|
      row = row.to_hash.transform_keys(&:downcase).transform_keys(&:to_sym)

      row.reject! { |k, _| !ALLOWED_KEYS.include?(k) }
      row.each do |key, value|
        if FLOAT_KEYS.include?(key)
          row[key] = value.to_f
        end
      end
    end
  end
end
