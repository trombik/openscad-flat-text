use <fonts/Bangers/Bangers-Regular.ttf>

flat_text_1 = "Default text line 1";
flat_text_2 = "Default text line 2";
flat_text_font = "Liberation Mono";
flat_text_size = 15;
flat_text_z_hight = 8;
flat_text_base_offset_factor = 0.25;
flat_text_base_offset = flat_text_size * flat_text_base_offset_factor;
flat_text_base_hight = 1.2;

module __flat_text(text, font, size)
{
    linear_extrude(flat_text_z_hight)
    text(text = text, size = size, font = font, halign = "center");
}

module __flat_text_base(text, font, size)
{
    linear_extrude(flat_text_base_hight) {
        offset(delta = flat_text_base_offset, chamfer = true) {
            text(text = text, size = size, font = font, halign = "center");
        }
    }
}


module __flat_text_first()
{
    __flat_text(text = flat_text_1, font = flat_text_font, size = flat_text_size);
    __flat_text_base(text = flat_text_1, font = flat_text_font, size = flat_text_size);
}

module __flat_text_second()
{
    __flat_text(text = flat_text_2, font = flat_text_font, size = flat_text_size);
    __flat_text_base(text = flat_text_2, font = flat_text_font, size = flat_text_size);
}

module flat_text()
{
    __flat_text_first();
    if (flat_text_2) {
        translate([0, 0 - flat_text_size * 1.2, 0]) {
            __flat_text_second();
        }
    }
}

flat_text();
