#ifndef __SPI_H__
#define __SPI_H__

void OledPutBuffer(int cb, BYTE* rgbTx);
BYTE Spi2PutByte(BYTE bVal);

#endif  //  !__SPI_H__