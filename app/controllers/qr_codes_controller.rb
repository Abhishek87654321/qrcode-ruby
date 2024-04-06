require "rqrcode"

class QrCodesController < ApplicationController
  def generate_qr
    url = params[:url]
    qrcode = RQRCode::QRCode.new(url.to_s)

    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
     # Convert the PNG image to a green-colored image
     @image_qrcode = Base64.strict_encode64(ChunkyPNG::Image.from_datastream(png.to_datastream).to_datastream.to_s)

  end

  def download
    file_name = SecureRandom.hex(8)
    send_data(Base64.decode64(params[:data]), type: 'image/png', disposition: 'attachment', filename: "#{file_name}.png")
  end
end
