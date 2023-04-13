import { IsNotEmpty, Max, Min } from 'class-validator';

export class CreateLocationBody {
  @IsNotEmpty()
  mainName: string;

  @IsNotEmpty()
  @Max(90)
  @Min(-90)
  latitude: number;

  @IsNotEmpty()
  @Max(180)
  @Min(-180)
  longitude: number;
}
