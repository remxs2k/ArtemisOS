
void write_string(const char* str){
    volatile char* vga = (char*)0xB8000; 
    while(*str){
        *vga++ = *str++;
        *vga++ = 0x1F; //White on blue
    }
}

void kernel_main(){
    write_string("Hello from C Kernel");
    while(1) {
        __asm__("hlt");
    }
}