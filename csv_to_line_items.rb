# frozen_string_literal: true

module CsvToLineItems
  ALLOWED_KEYS = [:price, :product, :quantity]
  FLOAT_KEYS = [:price, :quantity]

  def self.to_line_items(csv_path)
    CSV.read(csv_path, headers: :first_row).map do |row|
      # Downcasing all keys to give them a better chance of
      #   passing through our allow list.
      row = row.to_hash.transform_keys(&:downcase).transform_keys(&:strip).transform_keys(&:to_sym)

      # Only allowing defined keys
      row.reject! { |k, _| !ALLOWED_KEYS.include?(k) }

      # Ensuring numbers are numbers, and strings don't contain extra spacing
      row.each do |key, value|
        if FLOAT_KEYS.include?(key)
          row[key] = value.to_f
        else
          row[key] = value.strip
        end
      end
    end
  end
end
