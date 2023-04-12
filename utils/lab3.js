const max = 15;
for (let i = 0; i <= max; i++) {
  const bin = convertToBinary(i).padStart(4, '0');
  const count = convertToBinary(bin.split('1').length - 1).padStart(3, '0');
  // console.log(bin, count);
  console.log(`when "${bin}" =>
  out_case <= "${count}";`);
}

function convertToBinary(x) {
  let bin = 0;
  let rem,
    i = 1,
    step = 1;
  while (x != 0) {
    rem = x % 2;
    x = parseInt(x / 2);
    bin = bin + rem * i;
    i = i * 10;
  }
  // console.log(`Binary: ${bin}`);
  return String(bin);
}
