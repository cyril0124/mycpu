SECTIONS
{
    . = 0x00000000,
    .text : { *(.text) }
    . = 0x00001000;
    .data : { *(.data) }
    .bss : { *(.bss) }
}