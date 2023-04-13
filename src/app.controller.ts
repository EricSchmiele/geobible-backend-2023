import { Body, Controller, Get, Post } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { randomUUID } from 'crypto';
import { CreateLocationBody } from './create-location-body';

@Controller('locations')
export class AppController {
  constructor(private readonly prisma: PrismaService) {}

  @Get()
  getHello() {
    return this.prisma.location.findMany();
  }

  @Post()
  async create(@Body() body: CreateLocationBody) {
    const { mainName, latitude, longitude } = body;
    await this.prisma.location.create({
      data: {
        id: randomUUID(),
        mainName,
        latitude,
        longitude,
      },
    });
  }
}
