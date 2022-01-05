 
from pexpect import fdpexpect
from serial import Serial

class SerialExpect:
    """Capture serial line with a simple dis- and reconnect facility.
    Starts up in connected state"""

    # disconnect when using e2e_setup.py (cannot share the serial line)
    # re-connect after using e2e_setup.py

    def __init__(self, device_name="/dev/ttyUSB1", log_filename="icpu.log", baudrate=460800):
        self._serial = Serial(device_name, baudrate)

        # pylint: disable=R1732
        self._log_file = open(log_filename, "w+b")
        # pylint: enable=R1732

        # a too small maxread fails to read /dev/ttyUSB timely
        # (especially when booting from falsh)!
        self.fdpexpect = fdpexpect.fdspawn(self._serial.fd, maxread=5000, logfile=self._log_file, timeout=120)

    def connect(self):
        """connect to serial"""
        if not self._serial.is_open:
            self._serial.open()

    def disconnect(self):
        """disconnect serial"""
        self._log_file.flush()
        self._serial.close()

    def expect_exact(self, match, timeout=120):
        """expect exact"""
        return self.fdpexpect.expect_exact(match, timeout)

    def write(self, s):
        self._serial.write(f"{s}\n".encode())
    
def test_hello():
	dev_ttyusb = '/dev/ttyUSB0'
	ser = SerialExpect(device_name=dev_ttyusb, log_filename="test.log", baudrate=115200)
	ser.connect()
	ser.write("hello")
	ser.expect_exact("Hello, World", timeout=30)
	ser.disconnect()


