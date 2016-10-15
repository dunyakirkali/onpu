module Dropzone
  def show_dropzone_field(field)
    page.execute_script "$('input[type=file]:last').attr('id', '#{field}').css(        {
      'visibility': 'visible',
      'height': '50px',
      'width': '200px',
      'z-index': 99999999999
    });"
  end
end
