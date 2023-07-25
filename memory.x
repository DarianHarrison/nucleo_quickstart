MEMORY
{
  /* NOTE K = KiBi = 1024 bytes */
  /* TODO Adjust these memory regions to match your device memory layout */
  FLASH : ORIGIN = 0x8000000, LENGTH = 256K
  // FLASH : ORIGIN = 0x08000000, LENGTH = 256K // this may be incorrect just have it here will delete if all compiles well
  RAM : ORIGIN = 0x20000000, LENGTH = 64K
}
