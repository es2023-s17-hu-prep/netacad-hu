import { Injectable, Logger } from '@nestjs/common';
import { CreateMenuDto } from './dto/create-menu.dto';
import { UpdateMenuDto } from './dto/update-menu.dto';
import { PrismaService } from '../../libs/prisma/prisma.service';
import { Menu } from './entities/menu.entity';

@Injectable()
export class MenuService {
  private readonly logger = new Logger(MenuService.name);
  constructor(private readonly prismaService: PrismaService) {}

  create(createMenuDto: CreateMenuDto) {
    this.logger.log('Create menu item')
    return this.prismaService.menuItem.create({data: createMenuDto});
  }

  findAll(): Promise<Menu[]> {
    return this.prismaService.menuItem.findMany();
  }

  findOne(id: number): Promise<Menu> {
    return this.prismaService.menuItem.findUnique({where: {id}});
  }

  update(id: number, updateMenuDto: UpdateMenuDto) {
    this.logger.log('Update menu item')
    return this.prismaService.menuItem.update({data: updateMenuDto, where: {id}});
  }

  remove(id: number) {
    this.logger.log('Delete menu item')
    return this.prismaService.menuItem.delete({where: {id}});
  }
}
